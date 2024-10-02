package example.Weather;

import example.Weather.cn.ArrayOfString;
import example.Weather.cn.WeatherWS;
import example.Weather.cn.WeatherWSSoap;

import java.util.List;

/*
 * @Author: xiaotong
 * @CreateTime: 2024-10-01
 * @Description: client
 * @Version: 1.0
 */
public class Client{

    public static void main(String[] args){
        List<String> list=null;
        WeatherWS weatherService = new WeatherWS();
        WeatherWSSoap weatherWebServiceSoap = weatherService.getWeatherWSSoap();
        List<String> citys = weatherWebServiceSoap.getSupportCityString("31123").getString();
        int cityCode = 0;
        for (int i = 0; i < citys.size(); i++) {
            String city = citys.get(i);
            if (city.startsWith("巴中")) {
                cityCode =i;
                break;
            }
        }
        StringBuilder stringBuilder=new StringBuilder(citys.get(cityCode));
        stringBuilder.delete(0,3);
        System.out.println(stringBuilder);
        ArrayOfString weather = weatherWebServiceSoap.getWeather(stringBuilder.toString(),"");
        list = weather.getString();
        System.out.println(list);
    }
}
