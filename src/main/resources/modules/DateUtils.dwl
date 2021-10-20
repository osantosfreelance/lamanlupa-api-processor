%dw 2.0

var defaultDateFormat = "MMMM dd, uuuu"
var defaultTimeFormat = "KK:mm a"
var defaultDateTimeFormat = defaultDateFormat ++ " " ++ defaultTimeFormat

type defaultDate = Date { format: defaultDateFormat }
type defaultTime = DateTime  {format: defaultTimeFormat }
type defaultDateTime = DateTime { format: defaultDateTimeFormat }
type Epoch = DateTime { unit: "milliseconds" }

fun today() = now() as Date {format: "uuuu-MM-dd"}
fun today(format: String) = now() as String {format: format}
fun minusDays(date: Date, days: Period) = (date - days) as String {format: "uuuu-MM-dd"}

fun epochToStringCustomFormat(epoch: Epoch, format: String) = 
	epoch as String {format: format}
	
fun epochToDateTime(epoch: Epoch) =
	epoch as String {format: defaultDateTimeFormat}
	
fun epochToDate(epoch: Epoch) =
	epoch as String {format: defaultDateFormat}
	
fun epochToTime(epoch: Epoch) =
	epoch as String {format: defaultTimeFormat}