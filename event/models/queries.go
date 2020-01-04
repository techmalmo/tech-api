package models

const queryGetEvents = `with event as
(select
  events.id,
  events.title,
  events.description,
  events."when",
  created_at,
  (
	select
	  row_to_json(types)
  ) as type,
  (
	select
	  row_to_json(places)
  ) as place,
  (
	select
      json_agg(row)
    from (
	  select
	    *
	  from
	    public.tags
	  join
	    public.events_tags
	  on
	    public.tags.id = public.events_tags.tag_id
	  where
		public.events_tags.event_id = events.id
  ) row) as tags
from
  public.events
left join
  public.places on public.events.place_id = public.places.id
left join
  public.types on public.events.type_id = public.types.id
order by "when" desc)
select row_to_json(event) as object from event;`
