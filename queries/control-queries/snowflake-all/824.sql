select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,household_demographics hd,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 291 and ws.ws_hash <= 624 and cd.cd_hash >= 176 and cd.cd_hash <= 576 and hd.hd_hash >= 15 and hd.hd_hash <= 765
;
