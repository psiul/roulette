select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 307 and ss.ss_hash <= 707 and cd.cd_hash >= 280 and cd.cd_hash <= 613 and hd.hd_hash >= 69 and hd.hd_hash <= 819
;
