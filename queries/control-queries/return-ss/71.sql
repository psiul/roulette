select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 362 and ss.ss_hash <= 762 and hd.hd_hash >= 137 and hd.hd_hash <= 470 and cd.cd_hash >= 45 and cd.cd_hash <= 795
;
