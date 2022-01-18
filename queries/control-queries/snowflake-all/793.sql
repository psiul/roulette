select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,item i,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 86 and ws.ws_hash <= 836 and c.c_hash >= 253 and c.c_hash <= 586 and cd.cd_hash >= 300 and cd.cd_hash <= 700
;
