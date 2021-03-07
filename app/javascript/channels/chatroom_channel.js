import consumer from './consumer';

const initChatroomCable = () => {
	const messagesContainer = document.getElementById('messagesContainer');
	if (messagesContainer) {
		const id = messagesContainer.dataset.chatroom.id;

		consumer.subscriptions.create(
			{ channel: 'ChatroomChannel', id: id },
			{
				received(data) {
					console.log(data);
				},
			}
		);
	}
};

export { initChatroomCable };
