select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 24 and cd.cd_hash <= 774 and d.d_hash >= 285 and d.d_hash <= 618 and hd.hd_hash >= 383 and hd.hd_hash <= 783
;
