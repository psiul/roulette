select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,ship_mode sm,customer_demographics cd
where ws.ws_order_number = wr.wr_order_number and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 45 and ws.ws_hash <= 795 and sm.sm_hash >= 328 and sm.sm_hash <= 661 and cd.cd_hash >= 437 and cd.cd_hash <= 837
;
