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

`cargo run` should output the following, including a postgres log entry:

```
bash-5.0# cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.07s
     Running `target/debug/dbtest`
connecting
2020-09-10 02:12:54.919 GMT [171] LOG:  could not accept SSL connection: No error information
Segmentation fault (core dumped)
```
