#[tokio::main]
async fn main() {
    let db_url = "postgres://postgres@127.0.0.1/postgres";

    let options = sqlx::postgres::PgPoolOptions::new().max_connections(5);

    println!("connecting");

    options.connect(&db_url).await.expect("db");
}
