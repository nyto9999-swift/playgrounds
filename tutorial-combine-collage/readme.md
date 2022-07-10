## Key points
- In your day-to-day tasks, you’ll most likely have to deal with callback or delegate-based APIs. Luckily, those are easily wrapped as futures or publishers by using a subject.
- Moving from various patterns like delegation and callbacks to a single Publisher/Subscriber pattern makes mundane tasks like presenting views and fetching back values a breeze.
- To avoid unwanted side-effects when subscribing a publisher multiple times, use a shared publisher via the share() operator.
