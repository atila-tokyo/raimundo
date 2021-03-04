import flatpickr from 'flatpickr';
import { Portuguese } from 'flatpickr/dist/l10n/pt.js';
import moment from 'moment';

// website https://flatpickr.js.org/options/
// website http://t1m0n.name/air-datepicker/docs/#example-months

const datepicker = () => {
	const momentNow = moment();
	if (flatpickr('.datepicker')) {
		flatpickr('.datepicker', {
			enableTime: true,
			altInput: true,
			time_24hr: true,
			locale: Portuguese,
			dateFormat: 'd/m/Y H:i',
			altFormat: 'F j, Y H:i',
			defaultHour: momentNow.hour(),
			defaultMinute: momentNow.minutes(),
			minDate: new Date(),
		});
	}
};

export { datepicker };
