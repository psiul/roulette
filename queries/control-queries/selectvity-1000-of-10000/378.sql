select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 258 and d.d_hash <= 591 and hd.hd_hash >= 438 and hd.hd_hash <= 838 and cd.cd_hash >= 91 and cd.cd_hash <= 841
;
