select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and hd.hd_hash >= 104 and hd.hd_hash <= 854 and cd.cd_hash >= 217 and cd.cd_hash <= 617 and d.d_hash >= 376 and d.d_hash <= 709
;
