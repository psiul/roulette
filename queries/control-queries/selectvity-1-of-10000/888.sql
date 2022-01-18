select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 709 and ss.ss_hash <= 809 and hd.hd_hash >= 527 and hd.hd_hash <= 547 and cd.cd_hash >= 539 and cd.cd_hash <= 589
;
