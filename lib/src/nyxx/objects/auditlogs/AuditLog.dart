part of nyxx;

/// Represents [Guild]s audit log.
///
/// [Look here for more](https://discordapp.com/developers/docs/resources/audit-log)
class AuditLog {
  Client client;

  /// List of webhooks found in the audit log
  Map<Snowflake, Webhook> webhooks;

  /// List of users found in the audit log
  Map<Snowflake, User> users;

  /// List of audit log entires
  Map<Snowflake, AuditLogEntry> entries;

  Map<String, dynamic> raw;

  AuditLog._new(Client client, this.raw) {
    webhooks = new Map();
    users = new Map();
    entries = new Map();

    raw['webhooks'].forEach((dynamic o) {
      webhooks[new Snowflake(o['id'] as String)] =
          new Webhook._fromApi(client, o as Map<String, dynamic>);
    });

    raw['users'].forEach((dynamic o) {
      users[new Snowflake(o['id'] as String)] =
          new User._new(client, o as Map<String, dynamic>);
    });

    raw['audit_log_entries'].forEach((dynamic o) {
      entries[new Snowflake(o['id'] as String)] =
          new AuditLogEntry._new(client, o as Map<String, dynamic>);
    });
  }
}
