select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,web_returns wr,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 165 and ws.ws_hash <= 565 and hd.hd_hash >= 610 and hd.hd_hash <= 943 and cd.cd_hash >= 25 and cd.cd_hash <= 775
;
