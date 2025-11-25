create TABLE IF NOT EXISTS profile
(
    id       serial
        primary key,
    login    text not null,
    password text not null,
    salt     text not null
);



create TABLE IF NOT EXISTS record
(
    id           serial
        primary key,
    site_address text    not null,
    login        text    not null,
    password     text    not null,
    profile_id   integer not null
        constraint fk_record_profile
            references profile
);
