CREATE TABLE IF NOT EXISTS oauth_client_details (
  client_id VARCHAR(100) PRIMARY KEY,
  resource_ids VARCHAR(100),
  client_secret VARCHAR(100) NOT NULL,
  scope VARCHAR(100),
  authorized_grant_types VARCHAR(100),
  web_server_redirect_uri VARCHAR(100),
  authorities VARCHAR(100),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(400),
  autoapprove VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS oauth_client_token (
  token_id VARCHAR(100),
  token BLOB,
  authentication_id VARCHAR(100) PRIMARY KEY,
  user_name VARCHAR(100),
  client_id VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS oauth_access_token (
  token_id VARCHAR(100),
  token BLOB,
  authentication_id VARCHAR(100),
  user_name VARCHAR(100),
  client_id VARCHAR(100),
  authentication BLOB,
  refresh_token VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS oauth_refresh_token (
  token_id VARCHAR(100),
  token BLOB,
  authentication BLOB
);

CREATE TABLE IF NOT EXISTS oauth_code (
  code VARCHAR(100), authentication BLOB
);

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  enabled TINYINT(1),
  UNIQUE KEY unique_username(username)
);

CREATE TABLE IF NOT EXISTS authorities (
  username VARCHAR(100) NOT NULL,
  authority VARCHAR(100) NOT NULL,
  PRIMARY KEY(username, authority)
);