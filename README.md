# sqlx-alpine-segfault

A reproducible Docker image for https://github.com/launchbadge/sqlx/issues/677

Run these:
```
make build
make run
su postgres -c "postgres -D /postgres" &
# Hit enter to see your prompt!
ulimit -c unlimited # to enable core dumps
cargo run
```
