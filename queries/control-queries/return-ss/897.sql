select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 524 and ss.ss_hash <= 924 and hd.hd_hash >= 61 and hd.hd_hash <= 811 and cd.cd_hash >= 182 and cd.cd_hash <= 515
;
