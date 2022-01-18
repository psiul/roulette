select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 453 and cd.cd_hash <= 786 and d.d_hash >= 333 and d.d_hash <= 733 and hd.hd_hash >= 173 and hd.hd_hash <= 923
;
