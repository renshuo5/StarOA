package test.item;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.fjsdfx.starerp.item.model.Item;
import com.fjsdfx.starerp.item.model.ItemRelation;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemRelationService;
import com.fjsdfx.starerp.item.service.ItemService;
import com.fjsdfx.starerp.item.service.ItemTypeService;

public class TestItem {

	ApplicationContext cxt = new ClassPathXmlApplicationContext(
	"applicationContext.xml");
	HibernateTemplate hibernateTemplate=(HibernateTemplate)cxt.getBean("hibernateTemplate");
	ItemService itemService=(ItemService)cxt.getBean("itemServiceImpl");
	ItemTypeService itemTypeService = (ItemTypeService)cxt.getBean("itemTypeServiceImpl");
	ItemRelationService itemRelationService=(ItemRelationService)cxt.getBean("itemRelationServiceImpl");
	
	@Test
	public void test()
	{
		
		Item item1=new Item();
		item1.setName("item1");
		Item item2=new Item();
		item2.setName("item2");
		Item item3=new Item();
		item3.setName("item3");
		Item item4=new Item();
		item4.setName("item4");
		Item item5=new Item();
		item5.setName("item5");
		
		ItemType itemType11 = new ItemType();
		ItemType itemType12 = new ItemType();
		itemType11.setName("itemType11");
		itemType12.setName("itemType12");
		itemType11.setItem(item1);
		itemType12.setItem(item3);
		ItemType itemType21 = new ItemType();
		ItemType itemType22 = new ItemType();
		itemType21.setName("itemType21");
		itemType22.setName("itemType22");
		itemType21.setItem(item1);
		itemType22.setItem(item1);
		ItemType itemType31 = new ItemType();
		ItemType itemType32 = new ItemType();
		itemType31.setName("itemType31");
		itemType32.setName("itemType32");
		itemType31.setItem(item4);
		itemType32.setItem(item2);
		ItemType itemType41 = new ItemType();
		ItemType itemType42 = new ItemType();
		itemType41.setName("itemType41");
		itemType42.setName("itemType42");
		itemType41.setItem(item5);
		itemType42.setItem(item2);
		ItemType itemType51 = new ItemType();
		ItemType itemType52 = new ItemType();
		itemType51.setName("itemType51");
		itemType52.setName("itemType52");
		itemType51.setItem(item3);
		itemType52.setItem(item2);
		
		ItemRelation itemRelation1 = new ItemRelation();
		itemRelation1.setPitem(itemType11);
		itemRelation1.setPart(itemType21);
		
//		ItemRelation ir1=new ItemRelation();
//		ItemRelation ir2=new ItemRelation();
//		ItemRelation ir3=new ItemRelation();
//		ItemRelation ir4=new ItemRelation();
//		
//		ir1.setPitem(item1);
//		ir2.setPitem(item1);
//		ir3.setPitem(item1);
//		ir4.setPitem(item1);
//		ir1.setPart(item2);
//		ir2.setPart(item3);
//		ir3.setPart(item4);
//		ir4.setPart(item5);
//		Set s=new HashSet();
//		s.add(item2);
//		s.add(item3);
//		s.add(item4);
//		s.add(item5);
//		item1.setParts(s);
		

		
		itemService.save(item2);
		itemService.save(item3);
		itemService.save(item4);
		itemService.save(item5);
		itemService.save(item1);
		
		itemTypeService.save(itemType11);
		itemTypeService.save(itemType12);
		itemTypeService.save(itemType21);
		itemTypeService.save(itemType22);
		itemTypeService.save(itemType31);
		itemTypeService.save(itemType32);
		itemTypeService.save(itemType41);
		itemTypeService.save(itemType42);
		itemTypeService.save(itemType51);
		itemTypeService.save(itemType52);
		
		itemRelationService.save(itemRelation1);
//		itemRelationService.save(ir1);
//		itemRelationService.save(ir2);
//		itemRelationService.save(ir3);
//		itemRelationService.save(ir4);
	
	
	}
	
	@Test
	public void test1()
	{
		System.out.println("itemService : "+itemService);
		System.out.println("itemRelationService : "+itemRelationService);
		System.out.println("itemTypeService : "+itemTypeService);
	}
	
	@Test
	public void testSaveItemRelation()
	{
//		Item item1=itemService.findById(Item.class,6);
//		Item item2=itemService.findById(Item.class,7);
//		Item item3=itemService.findById(Item.class,8);
//		Item item4=itemService.findById(Item.class,9);
//		List<Item> parts=new ArrayList();
//		parts.add(item2);
//		parts.add(item3);
//		parts.add(item4);
//	for(Item i :parts)
//		{
//			System.out.println(i.getId()+"--"+i.getName());
//		}
//		
//		List<Integer> amounts=new ArrayList();
//		amounts.add(1);
//		amounts.add(2);
//		amounts.add(3);
//		itemRelationService.saveRelations(item1, parts, amounts);
//		
//		
	}
	
	@Test
	public void Testfind()
	{

		List<Item> l=itemService.findByHql("select  i.parts from Item i where i.id=5");
		
		for(Item i:l)
		{
			System.out.println(i.getName()+"----------------------------------------------");
		}
	}
}