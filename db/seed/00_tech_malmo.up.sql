BEGIN;

INSERT INTO public.places (id, name, zipcode, country, city, address, latlong) VALUES
  ('eda4737c-19be-406b-80bf-461702a2ed25', 'Assembly Hall at Shoreditch Town Hall', null, 'England', 'London', null, null),
  ('57160dfc-3211-4ff5-9c18-54702aa8975d', 'Theatre at Barbican', null, 'England', 'London', null, null),
  ('97d83c2a-444a-43d8-8db7-a968f866a8dd', 'Congress Hall at Congress Centre', null, 'England', 'London', null, null),
  ('8bf00f1f-6e5d-4f59-97e4-1d351391a908', 'The Light at The Light', null, 'England', 'London', null, null),
  ('6b3867e0-d5d6-417c-87a6-8ef11eebdd02', 'Atmosphere Ground at Atmosphere Venues', null, 'England', 'London', null, null),
  ('fb5d1ec6-157b-419f-81cd-a269a003e600', 'Bridewell Suite at Crowne Plaza', null, 'England', 'London', null, null),
  ('3b166764-0303-4ec9-a7cf-905cd5f8ecfb', 'Exclusive Hire Level 38 at Searcys at The Gherkin', null, 'England', 'London', null, null),
  ('3ff6bee2-101d-4f2d-8688-3a7a6229d948', 'Exclusive Venue Hire at Urban Golf', null, 'England', 'London', null, null),
  ('ad8b6a51-65c2-487c-9f47-97e02af49d3c', 'Prince Consort Rooms at The HAC', null, 'England', 'London', null, null),
  ('04ee5433-abf4-4da0-b43b-034a71dfa470', 'The Livery Hall at Vintner''s Hall', null, 'England', 'London', null, null);

INSERT INTO public.types (id, name) VALUES
  ('33008614-a4aa-46bb-95fb-551f72671434', 'discussion'),
  ('5a9fcb95-dff1-4d1f-8747-7c8ebf26e625', 'meetup'),
  ('f66f6771-a2dd-44c8-8590-08130af2b12a', 'workshop'),
  ('af41615f-9db1-4fa1-90ed-fa9f3547ebe1', 'presentation'),
  ('155c5df7-6dcc-4694-9d22-052df0b5fd77', 'conference');

INSERT INTO public.tags (id, name) VALUES
  ('cfdd7221-fada-4fd7-9c67-b6bab040f1ff', 'automation'),
  ('cd34254b-020b-4e44-b70d-055274450390', 'containers'),
  ('4ac3d452-9122-4623-8bf0-b18c2ef33fee', 'devops'),
  ('e643b32b-7f33-4c62-a6d0-9308d41e28e3', 'docker'),
  ('5723bd50-5e46-40bc-ba78-e0fcca8ebaca', 'integration'),
  ('2020c0a3-38e4-48cc-9ed1-7cc02645ed28', 'k8s'),
  ('509466c2-4721-4308-9103-7d215556d321', 'linux'),
  ('64d82693-64ac-4837-9f05-df212a60b770', 'network'),
  ('a8027e2b-7554-4d3f-bd40-1ac6674b104d', 'openstack'),
  ('15482e12-e7d7-4ca5-859c-be14caa5d306', 'vagrant');

INSERT INTO public.events (id, title, description, type_id, place_id, "when") VALUES
  ('9a94f71d-be23-4dbc-9ce9-05ce8eb771ef', 'ProductCon London: The Product Management Conference', 'ProductCon is the largest product management conference series in the world. It is organized by Product School and takes place five times a year in San Francisco, Los Angeles, New York, Seattle and London. The speaker lineup features product leaders from Google, Slack, Amazon, Airbnb, Netflix, Facebook and more. You’ll learn best practices behind the most successful products, and new trends in AI, VR, IoT and Blockchain. You’ll also have the opportunity to interact with all our sponsor companies interested in recruiting PMs. Get ready to level up your product management skills, network with a global community of fellow product leaders and have a ball!', '155c5df7-6dcc-4694-9d22-052df0b5fd77', 'eda4737c-19be-406b-80bf-461702a2ed25', '2020-02-11 09:00:00'),
  ('73bf3774-aee4-495c-bf48-c48555c23441', 'NDC London 2020 | Conference for Software Developers', 'NDC began in Oslo in 2008, since then it has grown annually seeing more attendees, speakers, and partners. In December 2013 we did the first NDC London conference. The conference was a huge success and we are happy to announce that the 7th NDC London is set to happen the week of 27- 31 Jan 2020. NDC London 2020 is a full week event with Pre-Conference Workshops on 27-28 January followed by the actual conference 29-31 January. Both the workshops and the conference will be held at QEII in Westminster, Central London.', '155c5df7-6dcc-4694-9d22-052df0b5fd77', '57160dfc-3211-4ff5-9c18-54702aa8975d', '2020-01-27 17:00:00'),
  ('1ce29914-06aa-4902-b0cb-4d6ae8732859', 'LSX World Congress 2020', 'The 6th annual LSX World Congress is a high-calibre, senior executive, two-day conference, exhibition and partnering event providing the education, strategies, solutions and contacts that life science executives need to enable more effective investment, planning and strategic growth within their businesses. It is the leading event for attracting the C-suite of the global life science industry. With a relentless focus on quality peer-to-peer discussion, high-level networking and partnering, unique formats and a vetted, high-calibre audience, the LSX World Congress brings together the people that matter to the future of healthcare. LSX World Congress brings together Biotech, Medtech, Healthtech and Deeptech all under one roof. It’s an incredible two days that you’ll want to be part of.', '155c5df7-6dcc-4694-9d22-052df0b5fd77', '6b3867e0-d5d6-417c-87a6-8ef11eebdd02', '2020-02-04 18:00:00'),
  ('9e661189-9545-4164-8a13-ae35f91ac246', 'Artificial Intelligence & Big Data Conference & Exhibition Global 2020', 'It''s back! The AI & Big Data Expo Global, the leading Artificial Intelligence & Big Data Conference & Exhibition is taking place on 17-18th March 2020 at the Olympia in London. It will showcase the next generation technologies and strategies from the world of Artificial Intelligence & Big Data, providing an opportunity to explore and discover the practical and successful implementation of AI & Big Data to drive your business forward in 2020 and beyond. Our high-level conferences will bring together forward thinking brands, market leaders, AI & Big Data evangelists and hot start-ups to explore and debate the advancements in Artificial Intelligence & Big Data, the impacts within Enterprise & Consumer sectors as well as Development platforms and Digital Transformation opportunities.', '155c5df7-6dcc-4694-9d22-052df0b5fd77', 'ad8b6a51-65c2-487c-9f47-97e02af49d3c', '2020-03-17 10:00:00'),
  ('7b852319-5bdd-4b8a-af86-19637d9de23f', 'Turing presents AI UK', 'The Alan Turing Institute continues to pursue its ambitious goals: by advancing world class research in data science and artificial intelligence (AI), training and inspiring the leaders of the future, and shaping the public conversation. For the first time a dynamic, two-day showcase will see the Turing bring together all three of these goals in an unrivalled showcase featuring the very best of UK academic work in AI and machine learning.', 'af41615f-9db1-4fa1-90ed-fa9f3547ebe1', '04ee5433-abf4-4da0-b43b-034a71dfa470', '2020-02-04 18:00:00');

INSERT INTO public.events_tags (event_id, tag_id) VALUES
  ('9e661189-9545-4164-8a13-ae35f91ac246','cfdd7221-fada-4fd7-9c67-b6bab040f1ff'),
  ('9e661189-9545-4164-8a13-ae35f91ac246','5723bd50-5e46-40bc-ba78-e0fcca8ebaca'),
  ('9e661189-9545-4164-8a13-ae35f91ac246','64d82693-64ac-4837-9f05-df212a60b770'),
  ('73bf3774-aee4-495c-bf48-c48555c23441','4ac3d452-9122-4623-8bf0-b18c2ef33fee'),
  ('73bf3774-aee4-495c-bf48-c48555c23441','e643b32b-7f33-4c62-a6d0-9308d41e28e3'),
  ('73bf3774-aee4-495c-bf48-c48555c23441','2020c0a3-38e4-48cc-9ed1-7cc02645ed28'),
  ('73bf3774-aee4-495c-bf48-c48555c23441','a8027e2b-7554-4d3f-bd40-1ac6674b104d'),
  ('7b852319-5bdd-4b8a-af86-19637d9de23f','cfdd7221-fada-4fd7-9c67-b6bab040f1ff'),
  ('9a94f71d-be23-4dbc-9ce9-05ce8eb771ef','509466c2-4721-4308-9103-7d215556d321');

COMMIT;
