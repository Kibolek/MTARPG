

-- SETTINGS
DBHandler=nil
DBName= ""
DBUser= ""
DBPass= "" 
DBHost= ""

-- FUNCTIONS
function dbSet(...)
	if not {...} then return end
	local query=dbExec(DBHandler, ...)
	return query
end

function dbGet(...)
	if not {...} then return end
	local query=dbQuery(DBHandler, ...)
	local result=dbPoll(query, -1)
	return result
end


addEventHandler("onResourceStart", resourceRoot, function()
	DBHandler=dbConnect("mysql", "dbname="..DBName..";host="..DBHost.."", DBUser, DBPass, "share=1")
	if DBHandler then
		outputDebugString("* Pomyślnie połączono z bazą danych.")
	else
		outputDebugString("Nie połączyłeś się z danych, trwa zatrzymywanie zasobu.")
		stopResource(getThisResource())
	end
end)

