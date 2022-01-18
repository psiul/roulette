select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,customer_demographics cd,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 403 and ws.ws_hash <= 803 and hd.hd_hash >= 67 and hd.hd_hash <= 400 and cd.cd_hash >= 143 and cd.cd_hash <= 893
;
