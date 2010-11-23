create table article (
	artid integer primary key autoincrement,
	url text not null,
	title text
);
create table tag (
       tagid integer primary key autoincrement,
       tag text not null
);
create table taglinks (
       artid integer not null references article(artid),
       tagid integer not null references tag(tagid),
       primary key (artid,tagid)
);

-- useless now ; created while parsing pearltrees.rdf

-- create virtual table webpage using fts3 (
--        pgcontent text,
--        artid integer not null references article(artid)
-- );

.exit
