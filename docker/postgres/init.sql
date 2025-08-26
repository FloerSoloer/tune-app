-- public.artist_cluster definition
CREATE TABLE
  IF NOT EXISTS public.artist_cluster (
    id bpchar (24) PRIMARY KEY,
    "name" varchar(60) NULL
  );

-- public.track_cluster definition
CREATE TABLE
  IF NOT EXISTS public.track_cluster (
    id bpchar (24) PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    rev varchar(512) NULL,
    r_oa int4 NULL,
    remake bpchar (11) NULL CHECK (id <> remake),
    remake_r_oa int4 NULL CHECK (
      remake_r_oa IS NULL
      OR remake IS NOT NULL
    ),
    CONSTRAINT track_cluster_track_cluster_fk FOREIGN KEY (remake) REFERENCES public.track_cluster (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

-- public.tag definition
CREATE TABLE
  IF NOT EXISTS public.tag (
    "name" varchar(30) PRIMARY KEY,
    "type" varchar(30) UNIQUE NOT NULL
  );

-- public.artist definition
CREATE TABLE
  IF NOT EXISTS public.artist (
    id bpchar (24) PRIMARY KEY,
    "cluster" bpchar (24) NOT NULL,
    CONSTRAINT artist_artist_cluster_fk FOREIGN KEY (id) REFERENCES public.artist_cluster (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

-- public.track definition
CREATE TABLE
  IF NOT EXISTS public.track (
    id bpchar (11) PRIMARY KEY,
    "cluster" bpchar (11) NOT NULL,
    CONSTRAINT track_track_cluster_fk FOREIGN KEY (id) REFERENCES public.track_cluster (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

-- public.track_artists definition
CREATE TABLE
  IF NOT EXISTS public.track_artists (
    track bpchar (11) NOT NULL,
    artist bpchar (24) NOT NULL,
    CONSTRAINT track_artists_pk PRIMARY KEY (track, artist),
    CONSTRAINT track_artists_artist_cluster_fk FOREIGN KEY (artist) REFERENCES public.artist_cluster (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT track_artists_track_cluster_fk FOREIGN KEY (track) REFERENCES public.track_cluster (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

-- public.track_tags definition
CREATE TABLE
  IF NOT EXISTS public.track_tags (
    track bpchar (11) NOT NULL,
    tag varchar(30) NOT NULL,
    CONSTRAINT track_tags_pk PRIMARY KEY (track, tag),
    CONSTRAINT track_tags_tag_fk FOREIGN KEY (tag) REFERENCES public.tag ("name") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT track_tags_track_cluster_fk FOREIGN KEY (track) REFERENCES public.track_cluster (id) ON DELETE CASCADE ON UPDATE CASCADE
  );