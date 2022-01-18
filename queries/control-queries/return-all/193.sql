select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 347 and ss.ss_hash <= 680 and cd.cd_hash >= 416 and cd.cd_hash <= 816 and hd.hd_hash >= 135 and hd.hd_hash <= 885
;
