select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,store_returns sr,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 100 and ss.ss_hash <= 850 and hd.hd_hash >= 376 and hd.hd_hash <= 709 and cd.cd_hash >= 274 and cd.cd_hash <= 674
;
