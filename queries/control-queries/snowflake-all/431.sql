select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,date_dim d,customer c
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 20 and ws.ws_hash <= 420 and cd.cd_hash >= 515 and cd.cd_hash <= 848 and d.d_hash >= 8 and d.d_hash <= 758
;
