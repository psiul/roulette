select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and hd.hd_hash >= 108 and hd.hd_hash <= 441 and d.d_hash >= 17 and d.d_hash <= 767 and cd.cd_hash >= 579 and cd.cd_hash <= 979
;
