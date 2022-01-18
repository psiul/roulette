select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 182 and ss.ss_hash <= 515 and cd.cd_hash >= 521 and cd.cd_hash <= 921 and hd.hd_hash >= 239 and hd.hd_hash <= 989
;
