select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 663 and cd.cd_hash <= 996 and hd.hd_hash >= 7 and hd.hd_hash <= 757 and d.d_hash >= 391 and d.d_hash <= 791
;
