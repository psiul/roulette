select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,household_demographics hd,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 646 and ws.ws_hash <= 979 and i.i_hash >= 562 and i.i_hash <= 962 and d.d_hash >= 126 and d.d_hash <= 876
;
