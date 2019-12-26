BEGIN;

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;

CREATE FUNCTION public.set_modified() RETURNS trigger
    LANGUAGE plpgsql AS
$BODY$
DECLARE
    field text := TG_ARGV[0];
BEGIN
    RETURN (
        SELECT json_populate_record(
            NEW,
            json_object(ARRAY[field, NOW()::text])
        )
    )::record;
END;
$BODY$;

CREATE TABLE public.sources (
    id uuid PRIMARY KEY NOT NULL DEFAULT public.gen_random_uuid(),
    name character varying NOT NULL,
    properties jsonb DEFAULT '{}'::jsonb NOT NULL
);

COMMENT ON TABLE public.sources IS 'event sources (meetup/eventbrite/foocafe)';

CREATE TABLE public.places (
    id uuid PRIMARY KEY NOT NULL DEFAULT public.gen_random_uuid(),
    name character varying NOT NULL,
    zipcode character varying,  -- note that all
    country character varying,  -- place attributes
    city character varying,     -- are optional
    address character varying,  -- except "id" and "name"
    latlong point               -- geographic coordinats
);

COMMENT ON TABLE public.places IS 'event places';

CREATE TABLE public.types (
    id uuid PRIMARY KEY NOT NULL DEFAULT public.gen_random_uuid(),
    name character varying NOT NULL
);

COMMENT ON TABLE public.types IS 'event types (meetup/conference/workshop)';

CREATE TABLE public.events (
    id uuid PRIMARY KEY NOT NULL DEFAULT public.gen_random_uuid(),
    source_id uuid,                   -- event source (API/website)
    source_url character varying,     -- link to the original event
    alias character varying,          -- SEO friendly local alias
    title character varying NOT NULL, -- full title
    description character varying,
    type_id uuid,                     -- optional
    place_id uuid,                    -- allow NULL to announce upcoming events
    "when" timestamp with time zone,  -- allow NULL to announce upcoming events
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT source_fkey FOREIGN KEY (source_id)
    REFERENCES public.sources (id) MATCH SIMPLE,
    CONSTRAINT type_fkey FOREIGN KEY (type_id)
    REFERENCES public.types (id) MATCH SIMPLE,
    CONSTRAINT place_fkey FOREIGN KEY (place_id)
    REFERENCES public.places (id) MATCH SIMPLE
);

CREATE TRIGGER events_modified
    BEFORE UPDATE ON public.events
    FOR EACH ROW
    WHEN (old.* IS DISTINCT FROM new.*)
    EXECUTE PROCEDURE public.set_modified('updated_at');

CREATE TABLE public.tags (
    id uuid PRIMARY KEY NOT NULL DEFAULT public.gen_random_uuid(),
    name character varying NOT NULL
);

COMMENT ON TABLE public.tags IS 'tags to better identify event purpose';

CREATE TABLE public.events_tags (
    event_id uuid NOT NULL,
    tag_id uuid NOT NULL,
    PRIMARY KEY (event_id, tag_id),
    CONSTRAINT events_fkey FOREIGN KEY (event_id)
    REFERENCES public.events (id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT tags_fkey FOREIGN KEY (tag_id)
    REFERENCES public.tags (id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE public.images (
    id uuid PRIMARY KEY NOT NULL DEFAULT public.gen_random_uuid(),
    link character varying NOT NULL,  -- link to the local storage
    original_link character varying,  -- original image link
    alt character varying             -- alternative text
);

COMMENT ON TABLE public.images IS 'images attached to the event';

CREATE TABLE public.events_images (
    event_id uuid NOT NULL,
    image_id uuid NOT NULL,
    PRIMARY KEY (event_id, image_id),
    CONSTRAINT events_fkey FOREIGN KEY (event_id)
    REFERENCES public.events (id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT images_fkey FOREIGN KEY (image_id)
    REFERENCES public.images (id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE
);

COMMIT;
