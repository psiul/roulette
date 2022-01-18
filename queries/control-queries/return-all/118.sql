select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 187 and cd.cd_hash <= 937 and hd.hd_hash >= 166 and hd.hd_hash <= 499 and d.d_hash >= 20 and d.d_hash <= 420
;
