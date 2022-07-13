## Key points

- A publisher can be a simple method that leverages other publishers for convenience.
- Writing a custom publisher usually involves creating an accompanying Subscription.
- The Subscription is the real link between a Subscriber and a Publisher.
- In most cases, the Subscription is the one that does all the work.
- A Subscriber can control the delivery of values by adjusting its Demand.
- The Subscription is responsible for respecting the subscriber’s Demand. Combine does not enforce it, but you definitely should respect it as a good citizen of the Combine ecosystem.
