import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';
import 'flatpickr/dist/themes/material_orange.css';
import { Portuguese } from 'flatpickr/dist/l10n/pt.js';
import moment from './node_modules/moment/src/moment';

// website https://flatpickr.js.org/options/
// website http://t1m0n.name/air-datepicker/docs/#example-months

const datepicker = () => {
	var currentdate = new Date();
	if (flatpickr('.datepicker')) {
		flatpickr('.datepicker', {
			dateFormat: 'd-m-Y H:i',
			locale: Portuguese,
			altInput: true,
			altFormat: 'F j, Y H:i',
			enableTime: true,
			defaultHour: currentdate.getHours(),
			defaultMinute: currentdate.getMinutes(),
			time_24hr: true,
            minDate: currentdate
		});
	}
};

export { datepicker };
