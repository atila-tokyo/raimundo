import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';
import 'flatpickr/dist/themes/material_orange.css';
import { Portuguese } from 'flatpickr/dist/l10n/pt.js';
import moment from 'moment';

// website https://flatpickr.js.org/options/
// website http://t1m0n.name/air-datepicker/docs/#example-months

const datepicker = () => {
	const momentNow = moment();
	if (flatpickr('.datepicker')) {
		flatpickr('.datepicker', {
			dateFormat: 'd/m/Y H:i',
			locale: Portuguese,
			altInput: true,
			altFormat: 'F j, Y H:i',
			enableTime: true,
			defaultHour: momentNow.hour(),
			defaultMinute: momentNow.minutes(),
			time_24hr: true,
			minDate: new Date()
		});
	}
};

export { datepicker };
