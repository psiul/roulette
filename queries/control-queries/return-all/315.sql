select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 275 and ws.ws_hash <= 675 and d.d_hash >= 128 and d.d_hash <= 878 and c.c_hash >= 304 and c.c_hash <= 637
;
