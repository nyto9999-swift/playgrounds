## Key points
- Sharing subscription work is critical when dealing with resource-heavy processes, such as networking.
- Use share() when you simply need to share a publisher with multiple subscribers.
- Use multicast(_:) when you need fine control over when the upstream publisher starts to work and how values propagate to subscribers.
- Use Future to share the single result of a computation to multiple subscribers.

```
share(), muticast, future
```
