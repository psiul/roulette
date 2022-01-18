select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,customer c,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 184 and i.i_hash <= 584 and d.d_hash >= 29 and d.d_hash <= 779 and cd.cd_hash >= 173 and cd.cd_hash <= 506
;
