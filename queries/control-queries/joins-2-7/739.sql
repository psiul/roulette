select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 155 and ss.ss_hash <= 355 and i.i_hash >= 159 and i.i_hash <= 659
;
