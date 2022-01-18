select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,item i,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 44 and ws.ws_hash <= 794 and d.d_hash >= 116 and d.d_hash <= 516 and sm.sm_hash >= 358 and sm.sm_hash <= 691
;
