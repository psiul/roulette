select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,date_dim d,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 330 and ws.ws_hash <= 663 and sm.sm_hash >= 243 and sm.sm_hash <= 993 and d.d_hash >= 312 and d.d_hash <= 712
;
