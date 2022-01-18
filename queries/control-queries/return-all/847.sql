select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,ship_mode sm,customer_demographics cd
where ws.ws_order_number = wr.wr_order_number and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 465 and ws.ws_hash <= 865 and d.d_hash >= 202 and d.d_hash <= 952 and cd.cd_hash >= 560 and cd.cd_hash <= 893
;
