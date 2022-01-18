select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 343 and ss.ss_hash <= 676 and cd.cd_hash >= 25 and cd.cd_hash <= 775 and hd.hd_hash >= 200 and hd.hd_hash <= 600
;
