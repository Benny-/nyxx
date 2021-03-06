part of nyxx;

/// Marks a snowflake entity. Snowflake entities are ones that have an id that uniquely identifies them.
/// Includes only actual id of entity and [createdAt] which is timestamp when entity was created.
class SnowflakeEntity {
  /// ID of entity as Snowflake
  final Snowflake id;

  /// Creates new snowflake
  const SnowflakeEntity(this.id);

  /// Gets creation timestamp included in [Snowflake]
  DateTime get createdAt => id.timestamp;

  @override
  int get hashCode => id.id.hashCode;

  @override
  bool operator ==(other) {
    if (other is SnowflakeEntity) return id == other.id;
    if (other is String) return id.id == other;

    return false;
  }
}
