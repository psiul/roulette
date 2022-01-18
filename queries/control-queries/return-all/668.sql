select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 634 and hd.hd_hash <= 967 and d.d_hash >= 105 and d.d_hash <= 855 and cd.cd_hash >= 31 and cd.cd_hash <= 431
;
