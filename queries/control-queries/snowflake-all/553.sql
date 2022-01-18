select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,date_dim d,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 298 and ws.ws_hash <= 631 and sm.sm_hash >= 121 and sm.sm_hash <= 871 and i.i_hash >= 77 and i.i_hash <= 477
;
