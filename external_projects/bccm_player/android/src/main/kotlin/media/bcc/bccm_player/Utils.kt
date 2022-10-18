package media.bcc.bccm_player

import android.os.Bundle
import org.json.JSONException
import org.json.JSONObject

class Utils {
    companion object {
        fun jsonStringToBundle(jsonString: String?): Bundle? {
            try {
                val jsonObject: JSONObject = toJsonObject(jsonString)
                return jsonToBundle(jsonObject)
            } catch (ignored: JSONException) {
            }
            return null
        }

        @Throws(JSONException::class)
        fun toJsonObject(jsonString: String?): JSONObject {
            return JSONObject(jsonString)
        }

        @Throws(JSONException::class)
        fun jsonToBundle(jsonObject: JSONObject): Bundle? {
            val bundle = Bundle()
            val iter: Iterator<*> = jsonObject.keys()
            while (iter.hasNext()) {
                val key = iter.next() as String
                val value: String = jsonObject.getString(key)
                bundle.putString(key, value)
            }
            return bundle
        }
    }
}