select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,item i,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and sm.sm_hash >= 593 and sm.sm_hash <= 993 and d.d_hash >= 335 and d.d_hash <= 668 and i.i_hash >= 203 and i.i_hash <= 953
;
