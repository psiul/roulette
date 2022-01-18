select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,date_dim d,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 443 and hd.hd_hash <= 776 and d.d_hash >= 229 and d.d_hash <= 629 and cd.cd_hash >= 247 and cd.cd_hash <= 997
;
