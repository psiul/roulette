select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,item i,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 144 and ws.ws_hash <= 544 and d.d_hash >= 454 and d.d_hash <= 787 and cd.cd_hash >= 46 and cd.cd_hash <= 796
;
